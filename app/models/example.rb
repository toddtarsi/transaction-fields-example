class Example < ApplicationRecord
  include WithStatuses

  # NOTE: only columns can go in this list.
  # other methods need to be explicitly referenced in the as_json merge
  def self.display_attr
    %i[]
  end

  def as_json(_options = nil)
    super(only: self.class.display_attr).merge(
      foo: 'bar'
    )
  end

  def serialized_metadata
    {}
  end

  private

  def to_map(models, attrs = nil)
    models.map { |m| [m.id, attrs.nil? ? m.attributes : m.attributes.slice(*attrs)] }.to_h
  end
end
