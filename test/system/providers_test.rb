require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase
  setup do
    @provider = providers(:one)
  end

  test "visiting the index" do
    visit providers_url
    assert_selector "h1", text: "Providers"
  end

  test "creating a Provider" do
    visit providers_url
    click_on "New Provider"

    fill_in "Business name", with: @provider.business_name
    fill_in "Cedula", with: @provider.cedula
    fill_in "Districts", with: @provider.districts_id
    fill_in "Home address", with: @provider.home_address
    fill_in "Lastname", with: @provider.lastname
    fill_in "Nombre", with: @provider.nombre
    fill_in "Obs", with: @provider.obs
    check "Prov activo" if @provider.prov_activo
    fill_in "Ruc", with: @provider.ruc
    click_on "Create Provider"

    assert_text "Provider was successfully created"
    click_on "Back"
  end

  test "updating a Provider" do
    visit providers_url
    click_on "Edit", match: :first

    fill_in "Business name", with: @provider.business_name
    fill_in "Cedula", with: @provider.cedula
    fill_in "Districts", with: @provider.districts_id
    fill_in "Home address", with: @provider.home_address
    fill_in "Lastname", with: @provider.lastname
    fill_in "Nombre", with: @provider.nombre
    fill_in "Obs", with: @provider.obs
    check "Prov activo" if @provider.prov_activo
    fill_in "Ruc", with: @provider.ruc
    click_on "Update Provider"

    assert_text "Provider was successfully updated"
    click_on "Back"
  end

  test "destroying a Provider" do
    visit providers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Provider was successfully destroyed"
  end
end
