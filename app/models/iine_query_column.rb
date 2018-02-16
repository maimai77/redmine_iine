# frozen_string_literal: true

class IineQueryColumn < QueryAssociationColumn
  def value_object(object)
    super || 0
  end
end
