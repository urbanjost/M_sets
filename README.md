# THIS IS A WIP FOR A CONCEPT, NOT MUCH ELSE

[![](docs/images/sets.gif)](https://urbanjost.github.io/M_sets/fpm-ford/index.html)
# [M_sets](https://urbanjost.github.io/M_sets/man3.html)

## Name
   **M_sets**(3f) - functions reminiscent of Matlab set functions

## Description

Unions, intersection, and set membership

A small subset of set functions reminiscent of Matlab set functions. They currently
just work with vectors of default integer kind input and return sets but not the
subscripts of the original elements.

It basically uses some simple calls to the ORDERSORT module to provide the functionality
that are not tuned for performance and make loose use of memory allocation and space.

Set operations compare the elements in two sets to find commonalities or
differences. Currently the sets are arrays of integer numbers.

## Functions
 + union(A,B,setOrder)     - Set union of two arrays
 + unique(A,setOrder)      - Unique values in array
 + intersect(A,B,setOrder) - Set intersection of two arrays
 + setdiff(A,B,setOrder)   - Set difference of two arrays
 + ismember(A,B,setOrder)  - Array elements that are members of set array
 + setxor(A,B,setOrder)    - Set exclusive OR of two arrays

<!--
## Building the module using make![gmake](docs/images/gnu.gif)

This will compile the Fortran module and basic example programs that exercise the routines:

```bash
     git clone https://github.com/urbanjost/M_sets.git


     cd M_sets/src
     # change Makefile if not using one of the listed compilers

     # for gfortran
     make clean
     make gfortran

     # for ifort
     make clean
     make ifort

     # for nvfortran
     make clean
     make nvfortran
```
   Note that to specifically get release 2.0.0 you would use
```bash
     git clone --branch 2.0.0 https://github.com/urbanjost/M_sets.git
```
-->

---
## Build and test with![fpm](docs/images/fpm_logo.gif)

   Download the github repository and build it with
   fpm ( as described at [Fortran Package Manager](https://github.com/fortran-lang/fpm) )
```bash
        git clone https://github.com/urbanjost/M_sets.git
        cd M_sets
        fpm build
```

   or just list it as a dependency in your fpm.toml project file.

```toml
        [dependencies]
        M_sets        = { git = "https://github.com/urbanjost/M_sets.git" }
```
---
## Documentation ![docs](docs/images/docs.gif)

### User
   - [routines](https://urbanjost.github.io/M_sets/man3.html)
     are described in HTML form using the format of man-pages.
<!--
     and [programs](https://urbanjost.github.io/M_sets/man1.html)
-->
   - A single page that uses javascript to combine all the HTML
     descriptions of the man-pages is at
     [BOOK_M_sets](https://urbanjost.github.io/M_sets/BOOK_M_sets.html).

   - ![man-pages](docs/images/manpages.gif)
     There are man-pages in the repository download in the docs/ directory
     that may be installed on ULS (Unix-Like Systems).

      + [manpages.zip](https://urbanjost.github.io/M_sets/manpages.zip)
      + [manpages.tgz](https://urbanjost.github.io/M_sets/manpages.tgz)


   - [CHANGELOG](docs/CHANGELOG.md) provides a history of significant changes
---
### Developer
   - [ford(1) output](https://urbanjost.github.io/M_sets/fpm-ford/index.html).
   - [doxygen(1) output](https://urbanjost.github.io/M_sets/doxygen_out/html/index.html).
   - [github action status](docs/STATUS.md)
---

## References ![-](docs/images/ref.gif)

## See also ![-](docs/images/demos.gif)
   * [M_orderpack](https://github.com/urbanjost/M_orderpack)

