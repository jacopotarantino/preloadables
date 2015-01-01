module Preloadables
  module PreloadablesHelper

    def preloadables_meta(preloadables)
      output = ''

      preloadables ||= {}

      unless preloadables[:domains].blank?
        output << preload_domains_meta(preloadables[:domains])
      end

      unless preloadables[:assets].blank?
        output << preload_assets_meta(preloadables[:assets])
      end

      unless preloadables[:pages].blank?
        output << prerender_pages_meta(preloadables[:pages])
      end

      output.html_safe
    end


    def preload_domains_meta(domains=[])
      render_markup_for(domains, 'dns-prefetch')
    end


    def preload_assets_meta(assets=[])
      render_markup_for(assets, 'prefetch')
    end


    def prerender_pages_meta(pages=[])
      render_markup_for(pages, 'prerender')
    end


    private

      def render_markup_for(links, type)
        markup = links.collect { |link|
          tag(:link, rel: type, href: link)
        }

        markup.join()
      end

  end
end
