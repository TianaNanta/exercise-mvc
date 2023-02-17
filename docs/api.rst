:tocdepth: 2
API
===

This part of the documentation lists the full API reference of all classes and functions.

WSGI
----

.. autoclass:: exercise_mvc.wsgi.ApplicationLoader
   :members:
   :show-inheritance:

Config
------

.. automodule:: exercise_mvc.config

.. autoclass:: exercise_mvc.config.application.Application
   :members:
   :show-inheritance:

.. autoclass:: exercise_mvc.config.redis.Redis
   :members:
   :show-inheritance:

.. automodule:: exercise_mvc.config.gunicorn

CLI
---

.. automodule:: exercise_mvc.cli

.. autofunction:: exercise_mvc.cli.cli.cli

.. autofunction:: exercise_mvc.cli.utils.validate_directory

.. autofunction:: exercise_mvc.cli.serve.serve

App
---

.. automodule:: exercise_mvc.app

.. autofunction:: exercise_mvc.app.asgi.on_startup

.. autofunction:: exercise_mvc.app.asgi.on_shutdown

.. autofunction:: exercise_mvc.app.asgi.get_application

.. automodule:: exercise_mvc.app.router

Controllers
~~~~~~~~~~~

.. automodule:: exercise_mvc.app.controllers

.. autofunction:: exercise_mvc.app.controllers.ready.readiness_check

Models
~~~~~~

.. automodule:: exercise_mvc.app.models

Views
~~~~~

.. automodule:: exercise_mvc.app.views

.. autoclass:: exercise_mvc.app.views.error.ErrorModel
   :members:
   :show-inheritance:

.. autoclass:: exercise_mvc.app.views.error.ErrorResponse
   :members:
   :show-inheritance:

Exceptions
~~~~~~~~~~

.. automodule:: exercise_mvc.app.exceptions

.. autoclass:: exercise_mvc.app.exceptions.http.HTTPException
   :members:
   :show-inheritance:

.. autofunction:: exercise_mvc.app.exceptions.http.http_exception_handler

Utils
~~~~~

.. automodule:: exercise_mvc.app.utils

.. autoclass:: exercise_mvc.app.utils.aiohttp_client.AiohttpClient
   :members:
   :show-inheritance:

.. autoclass:: exercise_mvc.app.utils.redis.RedisClient
   :members:
   :show-inheritance:
