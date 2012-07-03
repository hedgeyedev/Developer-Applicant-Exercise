shared_examples_for "a controller type check" do
	it { should respond_with_content_type(/json/) }
	it { should_not respond_with_content_type(:xml) }
	it { should_not respond_with_content_type(:csv) }
	it { should_not respond_with_content_type(:atom) }
	it { should_not respond_with_content_type(:yaml) }
	it { should_not respond_with_content_type(:text) }
	it { should_not respond_with_content_type('application/rss+xml') }
end

shared_examples_for "a controller render check" do | action |
		it { should render_template(action)  }
		it { should_not render_with_layout }
		it { should respond_with(:success) }
end
