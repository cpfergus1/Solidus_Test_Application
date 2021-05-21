module AmazingStore
  module Spree
    module ActiveStorageAdapter
      module Attachment
        module NewVariant

          def variant(style = nil)
            size = style_to_size(style)
            @attachment.variant(
              resize_and_pad: size.append(background: "blue"),
              format: :png,
              saver: { quality: 40 },
              rotate: 180,
              strip: true
            ).processed

          end
          ::Spree::ActiveStorageAdapter::Attachment.prepend self
        end
      end
    end
  end
end
