<h3>{{ projet.getNom() }} [user.identite] </h3>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Détails du projet</h3>
    </div>
    <div class="panel-body">
        {{ projet.getDescription() }}
    </div>
    <div class="panel-footer">
        Date de lancement : {{ projet.getDateLancement() }}<br/>
        Date de fin prévue : {{ projet.getDateFinPrevue() }}
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Equipe</h3>
    </div>
    <div class="panel-body">

        {% for dev in projet.getUsecases() %}
            {{ dev.getCode() }}
        {% endfor %}
    </div>
</div>
</div>

<button id="btnMessages">Messages...</button>
