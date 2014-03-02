<?php

require 'workflow.php';

$query = ltrim($argv[1]);
$parts = explode(' ', $query);

Workflow::init($query);

if (Workflow::checkUpdate()) {
    $cmds = array(
        'update' => 'There is an update for this Alfred workflow',
        'deactivate autoupdate' => 'Deactivate auto updating this Alfred Workflow'
    );
    foreach ($cmds as $cmd => $desc) {
        Workflow::addItem(Item::create()
            ->prefix('gh ')
            ->title('> ' . $cmd)
            ->subtitle($desc)
            ->arg('> ' . str_replace(' ', '-', $cmd))
            ->randomUid()
        , false);
    }
    print Workflow::getItemsAsXml();
    exit;
}

if (!Workflow::getConfig('user')) {

    $user = null;
    if (count($parts) > 1 && $parts[0] == '>' && $parts[1] == 'login' && isset($parts[2])) {
        $user = $parts[2];
    }
    Workflow::addItem(Item::create()
        ->prefix('gh ')
        ->title('> login ' . $user)
        ->subtitle('Log in to GitHub')
        ->arg('> login ' . $user)
        ->valid((bool) $user, '<user>')
    );
    print Workflow::getItemsAsXml();
    return;

}

$isSystem = isset($query[0]) && $query[0] == '>';
$isMy = 'my' == $parts[0] && isset($parts[1]);
$isUser = isset($query[0]) && $query[0] == '@';
$isRepo = false;
$queryUser = null;
if ($isUser) {
    $queryUser = ltrim($parts[0], '@');
} elseif (($pos = strpos($parts[0], '/')) !== false) {
    $queryUser = substr($parts[0], 0, $pos);
    $isRepo = true;
}

if (!$isSystem) {

    if (!$isUser && !$isMy && $isRepo && isset($parts[1])) {

        if (isset($parts[1][0]) && in_array($parts[1][0], array('#', ':', '/'))) {

            $compareDescription = false;
            $pathAdd = '';
            switch ($parts[1][0]) {
                case ':':
                    $path = 'branches';
                    $url = 'tree';
                    break;
                case '/':
                    $masterBranch = Workflow::requestCacheJson('https://api.github.com/repos/' . $parts[0], 'master_branch');
                    $branches = Workflow::requestCacheJson('https://github.com/command_bar/' . $parts[0] . '/branches', 'results');
                    foreach ($branches as $branch) {
                        if ($branch->search === $masterBranch) {
                            $pathAdd = '?q=&sha=' . $branch->description;
                            break;
                        }
                    }
                    $path = 'paths';
                    $url = 'blob/' . $masterBranch;
                    break;
                case '#':
                    $path = 'issues';
                    $url = 'issues';
                    if (isset($parts[1][1]) && intval($parts[1][1]) == 0) {
                        $pathAdd = '?q=' . substr($parts[1], 1);
                        $compareDescription = true;
                    }
                    break;
            }
            $subs = Workflow::requestCacheJson('https://github.com/command_bar/' . $parts[0] . '/' . $path . $pathAdd, 'results');
            foreach ($subs as $sub) {
                if (0 === strpos($sub->command, $parts[0] . ' ' . $parts[1][0])) {
                    $endPart = substr($sub->command, strlen($parts[0] . ' ' . $parts[1][0]));
                    Workflow::addItem(Item::create()
                        ->title($sub->command)
                        ->comparator($parts[0] . ' ' . $parts[1][0] . ($compareDescription ? $sub->description : $endPart))
                        ->subtitle($sub->description)
                        ->arg('https://github.com/' . $parts[0] . '/' . $url . '/' . $endPart)
                        ->prio((isset($sub->multiplier) ? $sub->multiplier : 1))
                    );
                }
            }

        } elseif ('issues' === $parts[1] && isset($parts[2])) {

            Workflow::addItem(Item::create()
                ->title($parts[0] . ' issues new')
                ->subtitle('Create new issue')
                ->arg('https://github.com/' . $parts[0] . '/issues/new')
            );

        } else {

            $subs = array(
                'issues ' => 'List, show and create issues',
                'pulls'   => 'Show open pull requests',
                'wiki'    => 'Pull up the wiki',
                'graphs'  => 'All the graphs',
                'network' => 'See the network',
                'admin'   => 'Manage this repo'
            );
            foreach ($subs as $key => $sub) {
                Workflow::addItem(Item::create()
                    ->title($parts[0] . ' ' . $key)
                    ->subtitle($sub)
                    ->arg('https://github.com/' . $parts[0] . '/' . $key)
                );
            }
            if (empty($parts[1])) {
                $subs = array(
                    '#' => 'Show a specific issue by number',
                    ':' => 'Show a specific branch',
                    '/' => 'Show a blob'
                );
                foreach ($subs as $key => $subtitle) {
                    Workflow::addItem(Item::create()
                        ->title($parts[0] . ' ' . $key)
                        ->subtitle($subtitle)
                        ->arg($key . ' ' . $parts[0])
                        ->valid(false)
                    );
                }
            }

        }

    } elseif (!$isUser && !$isMy) {

        $path = $isRepo ? 'repos_for/' . $queryUser : 'repos';
        $repos = Workflow::requestCacheJson('https://github.com/command_bar/' . $path, $isRepo ? 'repositories' : 'results');

        foreach ($repos as $repo) {
            Workflow::addItem(Item::create()
                ->title($repo->command . ' ')
                ->subtitle($repo->description)
                ->arg('https://github.com/' . $repo->command)
                ->prio(30 + (isset($repo->multiplier) ? $repo->multiplier : 1))
            );
        }

    }

    if (!$isMy) {
        if (!$isRepo) {
            $users = Workflow::requestCacheJson('https://github.com/command_bar/users', 'results');
            foreach ($users as $user) {
                $name = substr($user->command, 1);
                Workflow::addItem(Item::create()
                    ->prefix('@', false)
                    ->title($name)
                    ->subtitle($user->description)
                    ->arg('https://github.com/' . $name)
                    ->prio(20 + (isset($user->multiplier) ? $user->multiplier : 1))
                );
            }
        }
        Workflow::addItem(Item::create()
            ->title('my ')
            ->subtitle('Dashboard, settings, and more')
            ->prio(10)
            ->valid(false)
        );
    } else {
        $myPages = array(
            'dashboard'     => array('', 'View your dashboard'),
            'pulls'         => array('dashboard/pulls', 'View your pull requests'),
            'issues'        => array('dashboard/issues', 'View your issues'),
            'stars'         => array('stars', 'View your starred repositories'),
            'profile'       => array(Workflow::getConfig('user'), 'View your public user profile'),
            'settings'      => array('settings', 'View or edit your account settings'),
            'notifications' => array('notifications', 'View all your notifications')
        );
        foreach ($myPages as $key => $my) {
            Workflow::addItem(Item::create()
                ->title('my ' . $key)
                ->subtitle($my[1])
                ->arg('https://github.com/' . $my[0])
                ->prio(1)
            );
        }
    }

    Workflow::sortItems();

    if ($query) {
        $path = $isUser ? $queryUser : 'search?q=' . urlencode($query);
        Workflow::addItem(Item::create()
            ->title("Search GitHub for '$query'")
            ->arg('https://github.com/' . $path)
            ->autocomplete(false)
        , false);
    }

} else {

    $cmds = array(
        'logout' => 'Log out from GitHub (only this Alfred Workflow)',
        'delete cache' => 'Delete GitHub Cache (only for this Alfred Workflow)',
        'update' => 'Update this Alfred workflow'
    );
    if (Workflow::getConfig('autoupdate', true)) {
        $cmds['deactivate autoupdate'] = 'Deactivate auto updating this Alfred Workflow';
    } else {
        $cmds['activate autoupdate'] = 'Activate auto updating this Alfred Workflow';
    }
    foreach ($cmds as $cmd => $desc) {
        Workflow::addItem(Item::create()
            ->prefix('gh ')
            ->title('> ' . $cmd)
            ->subtitle($desc)
            ->arg('> ' . str_replace(' ', '-', $cmd))
        );
    }

    Workflow::sortItems();

}

print Workflow::getItemsAsXml();
