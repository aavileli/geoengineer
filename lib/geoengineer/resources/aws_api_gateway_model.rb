require_relative "./api_gateway/helpers"

########################################################################
# AwsCloudTrail is the +api_gatewat_rest_api+ terrform resource,
#
# {https://www.terraform.io/docs/providers/aws/r/api_gateway_model.html}
########################################################################
class GeoEngineer::Resources::AwsApiGatewayModel < GeoEngineer::Resource
  include GeoEngineer::ApiGatewayHelpers

  validate -> { validate_required_attributes([:rest_api_id, :name, :content_type, :schema]) }

  after :initialize, -> { _terraform_id -> { NullObject.maybe(remote_resource)._terraform_id } }
  after :initialize, -> { _geo_id -> { rand(36**20).to_s(36) } }

  def support_tags?
    false
  end
end
