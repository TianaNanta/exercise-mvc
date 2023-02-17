"""This project was generated with fastapi-mvc."""
import logging

from exercise_mvc.wsgi import ApplicationLoader
from exercise_mvc.version import __version__

# initialize logging
log = logging.getLogger(__name__)
log.addHandler(logging.NullHandler())

__all__ = ("ApplicationLoader", "__version__")
