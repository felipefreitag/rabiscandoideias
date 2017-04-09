class AddSubscriptionsCountToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :subscriptions_count, :integer, default: 0
  end
end
