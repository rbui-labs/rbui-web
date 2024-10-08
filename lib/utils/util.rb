class MethodCallFinder < Prism::Visitor
  attr_reader :calls

  def initialize(calls)
    @calls = calls
  end

  def visit_call_node(node)
    super
    calls << node.name
  end
end
