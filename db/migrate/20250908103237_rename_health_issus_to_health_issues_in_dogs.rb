class RenameHealthIssusToHealthIssuesInDogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :dogs, :health_issus, :health_issues
    rename_column :dogs, :health_issus_details, :health_issues_details
  end
end
