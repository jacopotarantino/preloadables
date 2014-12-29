module Preloadables
  module ApplicationHelper

    def preloadables_meta(preloadables={})
      output = ''

      unless preloadables[:domains].blank?
        output << preload_domains_meta(preloadables[:domains])
      end

      unless preloadables[:assets].blank?
        output << preload_assets_meta(preloadables[:assets])
      end

      unless preloadables[:pages].blank?
        output << prerender_pages_meta(preloadables[:pages])
      end

      output
    end


    def preload_domains_meta(domains)
      output = ''

      domains.each { |domain|
        output << "<link rel=\"dns-prefetch\" href=\"#{domain}\">"
      }

      output
    end


    def preload_assets_meta(assets)
      output = ''

      assets.each { |asset|
        output << "<link rel=\"prefetch\" href=\"#{asset}\">"
      }

      output
    end


    def prerender_pages_meta(pages)
      output = ''

      pages.each { |page|
        output << "<link rel=\"prerender\" href=\"#{page}\">"
      }

      output
    end

  end
end
