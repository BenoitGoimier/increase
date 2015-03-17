<?php

class UserController extends ControllerBase
{
    public function projectsAction($userId)
    {
        $user = User::findFirst($userId);
        $this->view->setVar("nom", $user);
    }

    public function projectAction($id)
    {
        $projet = Projet::findFirst($id);

        $this->view->setVars(array("projet"=> $projet));
    }
}