from setuptools import setup, Extension

from Cython.Build import cythonize

extensions = [
    Extension(name="pyOpenDRIVE/*", sources=["pyOpenDRIVE/*.pyx"], include_dirs=["pyOpenDRIVE/include"], extra_compile_args=["-fpermissive"])
]

#setup(ext_modules=cythonize(["pyOpenDRIVE/*.pyx"]))
setup(name="pyOpenDRIVE", version="0.1", ext_modules=cythonize(extensions))
