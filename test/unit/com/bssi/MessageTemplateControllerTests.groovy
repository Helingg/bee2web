package com.bssi



import org.junit.*
import grails.test.mixin.*

@TestFor(MessageTemplateController)
@Mock(MessageTemplate)
class MessageTemplateControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/messageTemplate/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.messageTemplateInstanceList.size() == 0
        assert model.messageTemplateInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.messageTemplateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.messageTemplateInstance != null
        assert view == '/messageTemplate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/messageTemplate/show/1'
        assert controller.flash.message != null
        assert MessageTemplate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/messageTemplate/list'


        populateValidParams(params)
        def messageTemplate = new MessageTemplate(params)

        assert messageTemplate.save() != null

        params.id = messageTemplate.id

        def model = controller.show()

        assert model.messageTemplateInstance == messageTemplate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/messageTemplate/list'


        populateValidParams(params)
        def messageTemplate = new MessageTemplate(params)

        assert messageTemplate.save() != null

        params.id = messageTemplate.id

        def model = controller.edit()

        assert model.messageTemplateInstance == messageTemplate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/messageTemplate/list'

        response.reset()


        populateValidParams(params)
        def messageTemplate = new MessageTemplate(params)

        assert messageTemplate.save() != null

        // test invalid parameters in update
        params.id = messageTemplate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/messageTemplate/edit"
        assert model.messageTemplateInstance != null

        messageTemplate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/messageTemplate/show/$messageTemplate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        messageTemplate.clearErrors()

        populateValidParams(params)
        params.id = messageTemplate.id
        params.version = -1
        controller.update()

        assert view == "/messageTemplate/edit"
        assert model.messageTemplateInstance != null
        assert model.messageTemplateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/messageTemplate/list'

        response.reset()

        populateValidParams(params)
        def messageTemplate = new MessageTemplate(params)

        assert messageTemplate.save() != null
        assert MessageTemplate.count() == 1

        params.id = messageTemplate.id

        controller.delete()

        assert MessageTemplate.count() == 0
        assert MessageTemplate.get(messageTemplate.id) == null
        assert response.redirectedUrl == '/messageTemplate/list'
    }
}
