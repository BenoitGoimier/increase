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
        $devs = [];
        $poidsTotal = 0;
        $poidsDev = [];
        foreach($projet->getUsecases() as $usecases)
        {
            if (!in_array($usecases->getUsers(),$devs)) {
                $devs.array_push($devs, $usecases->getUsers());
            }
            $poidsDev[$usecases->getUsers()->getId()] += $usecases->getPoids();
            $poidsTotal += $usecases->getPoids();
        }
        foreach($poidsDev as $poidsCent)
        {
            $poidsCent = $poidsCent / $poidsTotal * 100;
        }

        $this->view->setVars(array("projet"=> $projet, "devs"=> $devs, "poids" => $poidsDev));
    }
}