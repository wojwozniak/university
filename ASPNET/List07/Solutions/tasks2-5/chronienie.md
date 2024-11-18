## Ochrona zasobów

```cs
<configuration>
  <system.web>
    <authorization>
      <allow roles="Admin"/>
      <deny users="*"/>
    </authorization>
  </system.web>
</configuration>
```

## I dla pojedyńczych folderów

```cs
<configuration>
  <location path="Admin">
    <system.web>
      <authorization>
        <allow roles="Admin"/>
        <deny users="*"/>
      </authorization>
    </system.web>
  </location>
</configuration>

```