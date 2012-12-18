package com.bssi



import org.junit.*
import grails.test.mixin.*

@TestFor(ProviderTypeController)
@Mock(ProviderType)
class ProviderTypeControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/providerType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.providerTypeInstanceList.size() == 0
        assert model.providerTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.providerTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.providerTypeInstance != null
        assert view == '/providerType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/providerType/show/1'
        assert controller.flash.message != null
        assert ProviderType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/providerType/list'


        populateValidParams(params)
        def providerType = new ProviderType(params)

        assert providerType.save() != null

        params.id = providerType.id

        def model = controller.show()

        assert model.providerTypeInstance == providerType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/providerType/list'


        populateValidParams(params)
        def providerType = new ProviderType(params)

        assert providerType.save() != null

        params.id = providerType.id

        def model = controller.edit()

        assert model.providerTypeInstance == providerType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/providerType/list'

        response.reset()


        populateValidParams(params)
        def providerType = new ProviderType(params)

        assert providerType.save() != null

        // test invalid parameters in update
        params.id = providerType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/providerType/edit"
        assert model.providerTypeInstance != null

        providerType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/providerType/show/$providerType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        providerType.clearErrors()

        populateValidParams(params)
        params.id = providerType.id
        params.version = -1
        controller.update()

        assert view == "/providerType/edit"
        assert model.providerTypeInstance != null
        assert model.providerTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/providerType/list'

        response.reset()

        populateValidParams(params)
        def providerType = new ProviderType(params)

        assert providerType.save() != null
        assert ProviderType.count() == 1

        params.id = providerType.id

        controller.delete()

        assert ProviderType.count() == 0
        assert ProviderType.get(providerType.id) == null
        assert response.redirectedUrl == '/providerType/list'
    }
}
