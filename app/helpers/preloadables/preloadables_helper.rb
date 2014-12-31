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
      markup = domains.collect { |domain| tag(:link, rel: 'dns-prefetch', href: domain) }

      markup.join()
    end


    def preload_assets_meta(assets=[])
      markup = assets.collect { |asset| tag(:link, rel: 'prefetch', href: asset) }

      markup.join()
    end


    def prerender_pages_meta(pages=[])
      markup = pages.collect { |page| tag(:link, rel: 'prerender', href: page) }

      markup.join()
    end

  end
end
