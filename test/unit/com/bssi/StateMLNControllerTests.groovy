package com.bssi



import org.junit.*
import grails.test.mixin.*

@TestFor(StateMLNController)
@Mock(StateMLN)
class StateMLNControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stateMLN/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.stateMLNInstanceList.size() == 0
        assert model.stateMLNInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.stateMLNInstance != null
    }

    void testSave() {
        controller.save()

        assert model.stateMLNInstance != null
        assert view == '/stateMLN/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stateMLN/show/1'
        assert controller.flash.message != null
        assert StateMLN.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stateMLN/list'


        populateValidParams(params)
        def stateMLN = new StateMLN(params)

        assert stateMLN.save() != null

        params.id = stateMLN.id

        def model = controller.show()

        assert model.stateMLNInstance == stateMLN
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stateMLN/list'


        populateValidParams(params)
        def stateMLN = new StateMLN(params)

        assert stateMLN.save() != null

        params.id = stateMLN.id

        def model = controller.edit()

        assert model.stateMLNInstance == stateMLN
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stateMLN/list'

        response.reset()


        populateValidParams(params)
        def stateMLN = new StateMLN(params)

        assert stateMLN.save() != null

        // test invalid parameters in update
        params.id = stateMLN.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stateMLN/edit"
        assert model.stateMLNInstance != null

        stateMLN.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stateMLN/show/$stateMLN.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stateMLN.clearErrors()

        populateValidParams(params)
        params.id = stateMLN.id
        params.version = -1
        controller.update()

        assert view == "/stateMLN/edit"
        assert model.stateMLNInstance != null
        assert model.stateMLNInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stateMLN/list'

        response.reset()

        populateValidParams(params)
        def stateMLN = new StateMLN(params)

        assert stateMLN.save() != null
        assert StateMLN.count() == 1

        params.id = stateMLN.id

        controller.delete()

        assert StateMLN.count() == 0
        assert StateMLN.get(stateMLN.id) == null
        assert response.redirectedUrl == '/stateMLN/list'
    }
}
