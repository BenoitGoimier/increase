{% if nom.getRole() == 'user' %}
    <h3>Mes projets {{ nom.getIdentite() }}</h3>

    {% for projet in projets %}
        <div class="row">
            <div class="col-md-2">
                {{ projet.getNom() }}
            </div>

            <div class="col-md-6">
                <div class="progress">
                    <div class="progress-bar progress-bar-{{ class[projet.getId()] }} progress-bar-striped" role="progressbar" aria-valuenow="{{ percent[projet.getId()] }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ percent[projet.getId()] }}%">
                        {{ percent[projet.getId()] }}%
                    </div>
                </div>
            </div>

            <div class="col-md-2">
                {{ dayOff[projet.getId()] }} jour(s) restant(s)
            </div>

            <div class="col-md-2">
                <a class="btn btn-default form-control" href="../project/{{ projet.getId() }}">Ouvrir</a>
            </div>
        </div>
    {% endfor %}
{% else %}
    <div class="col-md-8 col-md-offset-2">
        <span class="glyphicon glyphicon-warning-sign"></span>
        Vous n'êtes pas autorisé à entrer! Veuillez vous connecter en tant qu'utilisateur!
        <span class="glyphicon glyphicon-warning-sign"></span>
    </div>
{% endif %}
