<?php

class UserController extends ControllerBase
{
    public function projectsAction($userId)
    {
        $user = User::findFirst($userId);

        $projets = Projet::find(array(
            "idClient = $userId"
        ));

        $this->view->setVars(array(
            "projets" => $projets,
            "nom" => $user
        ));
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
        for($i=0; $i<count($poidsDev); $i++)
        {
            $poidsDev[$i] = round($poidsDev[$i] / $poidsTotal * 100,2);
        }

        $this->view->setVars(array("projet"=> $projet, "devs"=> $devs, "poids" => $poidsDev));
    }
}