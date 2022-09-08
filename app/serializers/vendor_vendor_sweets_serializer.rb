class VendorVendorSweetsSerializer < ActiveModel::Serializer
    attributes :id, :name
    has_many :vendor_sweets
    has_many :sweets
end
