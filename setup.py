#!/usr/bin/env python3

from distutils.core import setup
from setuptools import setup
# Parametric System Instructions
setup(
    name='psi',
    version='0.1.0',
    author='Michael Cranston Ryan',
    author_email='spacetime.engineer@gmail.com',
    packages=[''],
    scripts=['examples/app.py'],
    #url='http://pypi.python.org/pypi/psi/',
    license='LICENSE.txt',
    description='Parametric System Interface',
    long_description=open('README.md').read(),
    install_requires=[

    ],

    classifiers=[
        'Development Status :: 1 - Planning',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: BSD License',  
        'Programming Language :: Python :: 3.9',
    ]
)
