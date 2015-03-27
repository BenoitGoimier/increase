<?php

class AuthorController extends ControllerBase
{

    public function projectsAction($userId)
    {
        $user = User::findFirst($userId);
        $dayOff = [];
        $percent = [];
        $class = [];

        $builder = new \Phalcon\Mvc\Model\Query\Builder();

        $projets = $builder
            ->columns(array("projet.id,projet.nom,usecase.avancement,usecase.poids,projet.dateFinPrevue,projet.dateLancement"))
            ->from("usecase")
            ->join("projet", "projet.id=usecase.idProjet")
            ->where("usecase.idDev =". $userId)
            ->groupBy(array('usecase.idProjet'))
            ->getQuery()
            ->execute();

        foreach($projets as $projet)
        {
            $dayOff[$projet->id] = $this->getDayOff($projet);
            $percent[$projet->id] = $this->getPercent($projet, $userId);
            $class[$projet->id] = $this->getClass($projet, $percent[$projet->id], $dayOff[$projet->id]);
        }


        $this->view->setVars(array(
            "projets" => $projets,
            "nom" => $user,
            "dayOff" => $dayOff,
            "percent" => $percent,
            "class" => $class
        ));
    }

    protected function getDayOff($projet)
    {
        $date1 = new DateTime(date("Y-m-d"));
        $date2 = new DateTime($projet->dateFinPrevue);
        $diff = $date1->diff($date2);

        if ($diff->format("%R") == "+"){
            return $diff->format("%a");
        } else {
            return 0;
        }
    }

    protected function getPercent($projet, $id) {
        $percent = 0;
        $total = 0;

        /*foreach($projet->usecase as $usecase)
        {
            if($usecase->getIdDev() == $id){
                $percent += $usecase->getPoids() * $usecase->getAvancement();
            }
            $total += $usecase->getPoids();
        }*/

        $percent /= $total;

        return round($percent,1);
    }

    protected function getClass($projet, $percent, $dayOff) {
        $date1 = new DateTime($projet->dateLancement);
        $date2 = new DateTime($projet->dateFinPrevue);
        $diff = $date1->diff($date2);

        $time = $diff->format("%a");
        $timePercent = ($time - $dayOff) / $time * 100;

        if($dayOff == 0){
            return "danger";
        } else if ($percent < $timePercent) {
            return "warning";
        } else {
            return "success";
        }

    }

    public function projectAction($idProjet=0, $idAuthor=0)
    {
        $projet = Projet::findFirst(array("id"=>$idProjet));

        if ($projet != false) {
            if ($idAuthor != 0) {
                $usecases = $projet->getUsecases();
            } else{
                $projet = "noUser";
            }
        } else{
            $projet = "noProjet";
        }

        $this->view->setVars(array(
            "projet"=> $projet,
            "usecases"=> $usecases,
            "author"=> $idAuthor,
        ));
    }

}