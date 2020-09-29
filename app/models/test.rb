                  -#  %p.image_select__text ドラックアンドドロップ<br>またはクリックしてファイルをアップロード
                  -#  #previews
                    -#  - if @item.persisted?
                    -#    - @item.images.each_with_index do |image, i|
                    -#      = image_tag image.src.url, data: { index: i }, width: "100", height: '100'
                    -#= f.fields_for :images, {class: "image_select__input", type: "file"} do |image|
                      -#.js-file_group{"data-index": "#{image.index}"}
                      -#  = image.file_field :src, class: 'js-file'
                    -# = f.file_field :images, {class: "image_select__input", type: "file"} do |image|
                    -#   .js-file_group{"data-index": "#{image.index}"}
                    -#     = i.file_field :src, class: 'js-file'
                    -# %input.image_select__input{type: "file"}
                    -# %p= icon("fas", "camera", class: "image_select__icon")
                  -#  %p.image_select__text ドラックアンドドロップ<br>またはクリックしてファイルをアップロード

                  