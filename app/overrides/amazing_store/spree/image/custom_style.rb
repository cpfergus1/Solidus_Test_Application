# module AmazingStore
#   module Spree
#     module Image
#       module CustomStyle
#         def self.prepended(klass)
#           klass.attachment_definitions[:attachment][:styles] = {
#             amazing_store_thumbnail: '60x60>',
#             amazing_store_sample: '400x800>',
#             amazing_store_sample_full: '1000x1000>',
#             mini: '48x48>',
#             small: '400x400>',
#             product: '680x680>',
#             large: '1200x1200>'
#           }
#         end

#         ::Spree::Image.prepend self
#       end
#     end
#   end
# end
