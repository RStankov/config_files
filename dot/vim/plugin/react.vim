command! Estyles :exe "edit ".expand('%:h')."/styles.css"
command! Vstyles :exe "vsplit ".expand('%:h')."/styles.css"

command! Efragmnet :exe "edit ".expand('%:h')."/Fragment.graphql"
command! Vfragment :exe "vsplit ".expand('%:h')."/Fragment.graphql"

command! Equery :exe "edit ".expand('%:h')."/Query.graphql"
command! Vquery :exe "vsplit ".expand('%:h')."/Query.graphql"

command! Emutation :exe "edit ".expand('%:h')."/Mutation.graphql"
command! Vmutation :exe "vsplit ".expand('%:h')."/Mutation.graphql"

command! Eutils :exe "edit ".expand('%:h')."/utils.graphql"
command! Vutils :exe "vsplit ".expand('%:h')."/utils.graphql"

command! Eindex :exe "edit ".expand('%:h')."/index.js"
command! Vindex :exe "vsplit ".expand('%:h')."/index.js"
