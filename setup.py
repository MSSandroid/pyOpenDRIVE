from setuptools import setup, Extension

from Cython.Build import cythonize

extensions = [
    Extension(name="pyOpenDRIVE/*", sources=["pyOpenDRIVE/*.pyx"], include_dirs=["pyOpenDRIVE/include"], extra_compile_args=["-fpermissive"])
]

#setup(ext_modules=cythonize(["pyOpenDRIVE/*.pyx"]))
setup(ext_modules=cythonize(extensions))