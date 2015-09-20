dotfiles
========

Here are my dotfiles, for example purpose.

They are managed using `GNU Stow <https://www.gnu.org/software/stow/>`_.


Initial setup
-------------

.. code-block:: console

    $ cd
    $ git clone https://github.com/pmuller/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ git submodule init
    $ git submodule update

* Windows:

    .. code-block:: console

        $ for P in bash mintty shells ssh-agent tmux top vim zsh; do stow $P; done

* Linux & Mac: 

    .. code-block:: console

        $ for P in bash shells ssh-agent tmux top vim zsh; do stow $P; done
