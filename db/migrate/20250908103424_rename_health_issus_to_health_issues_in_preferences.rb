class RenameHealthIssusToHealthIssuesInPreferences < ActiveRecord::Migration[7.1]
  def change
    rename_column :preferences, :health_issus, :health_issues
  end
end
