from setuptools import setup, find_packages

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name="170051277-trab-final",
    version="0.0.1",
    author="Nicolas Mantzos",
    author_email="georgeos.nicolas83@gmail.com",
    description="Trabalho final da disciplina Gerência de Configuração e Evolução de Software (GCES)",
    long_description="Trabalho final da disciplina Gerência de Configuração e Evolução de Software (GCES)",
    long_description_content_type="text/markdown",
    url="https://github.com/ngm1450/trabalho_individual_gces_170051277",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.8',
)



