<?php

class UserController extends ControllerBase
{
    public function projectsAction($userId)
    {
        $user = User::findFirst($userId);
        $projets = Projet::find($userId);
        $this->view->setVars(array(
        "projets" => $projets,
        "nom" => $user));
    }

    public function projectAction($id)
    {
        $projet = Projet::findFirst($id);
        $devs = [];
        foreach($projet->getUsecases() as $idDev)
        {
            if (!in_array($idDev->getUsers(),$devs)) {
                $devs.array_push($devs, $idDev->getUsers());
            }
        }
        $this->view->setVars(array("projet"=> $projet, "devs"=> $devs));
    }
}