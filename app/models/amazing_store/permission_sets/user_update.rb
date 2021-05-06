module AmazingStore
  module PermissionSets
    class UserUpdate < Spree::PermissionSets::Base
      def activate!
        can :update, Spree::User
      end
    end
  end
end
