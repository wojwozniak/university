## Pokazałem kilka z tych tagów w poprzednich zadaniach, tutaj rozpiska:

### Html.ActionLink

Link do akcji kontrolera

```cs
@Html.ActionLink("Go to Home", "Index", "Home")
```

### Html.BeginForm

Form z danymi do kontrolera

```cs
@using (Html.BeginForm("Start", "Home", FormMethod.Post)){}
```

### Html.CheckBoxFor

Checkbox powiązany z modelem

```cs
@Html.CheckBoxFor(model => model.IsAvailable)
```

### Html.DropDownListFor

Lista dropdown -,,-

```cs
@Html.DropDownListFor(model => model.SelectedCategory, new SelectList(Model.Categories, "Id", "Name"))
```

### Html.PasswordFor

Textbox do hasła

```cs
@Html.PasswordFor(model => model.Password)
```

### Html.RadioButtonFor

```cs
@Html.RadioButtonFor(model => model.SelectedOption, "Option1") Option 1
@Html.RadioButtonFor(model => model.SelectedOption, "Option2") Option 2
```

### Html.TextBoxFor

```cs
@Html.TextBoxFor(model => model.FirstName)
```

### Html.TextAreaFor

```cs
@Html.TextAreaFor(model => model.Description)
```

### Html.Raw

Html bez enkodowania, np. < to nie będzie &lt;

```cs
@Html.Raw(Model.DynamicHtmlContent)
```