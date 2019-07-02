.. |date| date::

*****************
Mendelian RNA-Seq
*****************

:authors: Komal Rathi
:contact: rathik@email.chop.edu
:organization: DBHi, CHOP
:status: This is "work in progress"
:date: |date|

.. meta::
   :keywords: mendelian, rnaseq, 2018
   :description: Mendelian RNA-seq analysis

Introduction
============

Scripts for Mendelian RNA-seq analysis. More to come later...

Details
=======

Gencode v19 annotations were downloaded from here: https://gtexportal.org/home/datasets

Pipeline
========

Please check the Wiki for details.

Conda Installation
==================

.. code-block:: bash
   
        conda create --name mendelian-rnaseq-env
        source activate mendelian-rnaseq-env
        conda install -c bioconda snakemake
        conda install -c bioconda rna-seqc
        conda install -c bioconda gatk
        conda install -c biobuilds plink
        conda install -c bioconda star
        conda install -c bioconda picard
        conda install -c bioconda bwa
        conda install -c anaconda colorama
        conda install -c bioconda misopy

