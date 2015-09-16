dotfiles
========

Here are my dotfiles, for example purpose.

They are managed using `GNU Stow <https://www.gnu.org/software/stow/>`_.


Initial setup
-------------

.. code-block:: console

    $ cd
    $ git clone https://github.com/pmuller/dotfiles.git
    $ cd dotfiles
    # Fetch git submodules
    $ git submodule init
    $ git submodule update
    # Run stow for each "package"
    $ for F in *; if [[ -d "$F" ]]; then stow $F; fi


Update
------

.. code-block:: console

    $ cd ~/dotfiles
    $ stow PACKAGE_NAME


vim
---

Whenever possible, vim plugins are managed using git submodules.
