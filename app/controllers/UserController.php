<?php

class UserController extends ControllerBase
{

    public function projectsAction($userId)
    {
        $user=User::findFirst($userId);
        $nom = $user->getIdentite();
        $this->view->setVar("nom", $nom);
    }

}