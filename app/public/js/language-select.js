// Updates language select so it contains valid languages for currently selected problem
var problem_languages = new Map(JSON.parse(document.getElementById("problem_languages").innerText))
var problem_select = document.getElementById("problemSelect") 
var language_select = document.getElementById("languageSelect") 

function updateLanguageSelect() {
    let problem = parseInt(problem_select.value);
    language_select.innerHTML = ""
    for (const language of problem_languages.get(problem))
    {
        let opt = document.createElement('option');
        opt.value = language.id;
        opt.innerHTML = language.name;
        language_select.appendChild(opt);
    }
}