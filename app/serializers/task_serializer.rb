class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :assigned_user_id
end
