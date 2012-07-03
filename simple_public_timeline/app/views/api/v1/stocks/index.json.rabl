object false
node(:status) { "collected" }
child @stocks => :stock do
	attributes :page_id, :name, :ptat_score, :link
end
