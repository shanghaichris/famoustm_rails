class AddAvatarColumnsToTrademark < ActiveRecord::Migration
  def self.up
        add_column :trademarks, :avatar_file_name,    :string
        add_column :trademarks, :avatar_content_type, :string
        add_column :trademarks, :avatar_file_size,    :integer
        add_column :trademarks, :avatar_updated_at,   :datetime
      end

      def self.down
        remove_column :trademarks, :avatar_file_name
        remove_column :trademarks, :avatar_content_type
        remove_column :trademarks, :avatar_file_size
        remove_column :trademarks, :avatar_updated_at
      end
end
