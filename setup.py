#!/usr/bin/env python3

from setuptools import setup

setup(
    name='mupy',
    version='0.1.5',
    author='Michael Cranston Ryan',
    author_email='spacetime.engineer@gmail.com',
    url='http://pypi.python.org/pypi/mupy/',
    license='LICENSE.txt',
    description='Manufacturing Utility',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Education',
        'Intended Audience :: Manufacturing',
        'Intended Audience :: Science/Research',
        'Intended Audience :: End Users/Desktop',
        'Intended Audience :: Developers',
        'Intended Audience :: Other Audience',
        'License :: OSI Approved :: BSD License',  
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Other', # Openscad programming language in particular.
    ]
)
