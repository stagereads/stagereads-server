require 'digest/sha1'

class Periodical < ActiveRecord::Base
  mount_uploader :resource, ResourceUploader

  validates_presence_of :resource
  validates_presence_of :name

  attr_accessible :resource, :name, :description

  before_create :encrypt_resource

  def encrypt_resource
    self.hashed_resource = Digest::SHA1.hexdigest( self.name ) unless self.hashed_resource
  end

  def to_param
   self.hashed_resource
  end

end
