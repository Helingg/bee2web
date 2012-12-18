package com.bssi

import grails.test.mixin.*

@TestFor(SegmentTemplateController)
@Mock(TemplateDatabase)
class TemplateDatabaseControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/templateDatabase/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.templateDatabaseInstanceList.size() == 0
        assert model.templateDatabaseInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.templateDatabaseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.templateDatabaseInstance != null
        assert view == '/templateDatabase/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/templateDatabase/show/1'
        assert controller.flash.message != null
        assert TemplateDatabase.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/templateDatabase/list'


        populateValidParams(params)
        def templateDatabase = new TemplateDatabase(params)

        assert templateDatabase.save() != null

        params.id = templateDatabase.id

        def model = controller.show()

        assert model.templateDatabaseInstance == templateDatabase
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/templateDatabase/list'


        populateValidParams(params)
        def templateDatabase = new TemplateDatabase(params)

        assert templateDatabase.save() != null

        params.id = templateDatabase.id

        def model = controller.edit()

        assert model.templateDatabaseInstance == templateDatabase
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/templateDatabase/list'

        response.reset()


        populateValidParams(params)
        def templateDatabase = new TemplateDatabase(params)

        assert templateDatabase.save() != null

        // test invalid parameters in update
        params.id = templateDatabase.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/templateDatabase/edit"
        assert model.templateDatabaseInstance != null

        templateDatabase.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/templateDatabase/show/$templateDatabase.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        templateDatabase.clearErrors()

        populateValidParams(params)
        params.id = templateDatabase.id
        params.version = -1
        controller.update()

        assert view == "/templateDatabase/edit"
        assert model.templateDatabaseInstance != null
        assert model.templateDatabaseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/templateDatabase/list'

        response.reset()

        populateValidParams(params)
        def templateDatabase = new TemplateDatabase(params)

        assert templateDatabase.save() != null
        assert TemplateDatabase.count() == 1

        params.id = templateDatabase.id

        controller.delete()

        assert TemplateDatabase.count() == 0
        assert TemplateDatabase.get(templateDatabase.id) == null
        assert response.redirectedUrl == '/templateDatabase/list'
    }
}
