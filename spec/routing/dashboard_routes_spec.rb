describe "routing to dashboard" do
  it "routes / to dashboard#show" do
    { :get => "/" }.should route_to(
      :controller => "dashboard",
      :action => "show",
    )
  end
end