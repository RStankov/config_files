class ApplicationMailer < ActionMailer::Base
  default :from => 'Our Team <team@example.org>'
  default_url_options[:host] = 'example.org'

  def mail(params, &block)
    super(params, &block).tap do |message|
      if message.multipart?
        message.parts.select(&:inline?).each { |part| post_process(part) }
      else
        post_process(message)
      end
    end
  end

  protected

  def post_process(message)
    if message.content_type !~ %r(text/plain)
      message.body = inline_css_in message.body.to_s
    end
  end

  def inline_css_in(html)
    options = {
      :with_html_string  => true,
      :css               => [Rails.root.join('public/assets/email.css')],
      :base_url          => 'http://example.org'
    }

    Premailer.new(html, options).to_inline_css
  end
end
