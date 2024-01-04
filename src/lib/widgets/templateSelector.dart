import 'package:flutter/material.dart';
import 'package:invoice/models/template.dart';
import 'package:invoice/services/template_service.dart';

class TemplateSelectorWidget extends StatefulWidget {
  const TemplateSelectorWidget({super.key});

  @override
  State<TemplateSelectorWidget> createState() => _TemplateSelectorWidgetState();
}

class _TemplateSelectorWidgetState extends State<TemplateSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    print(TemplateService.currentTemplate.templateName);
    return DropdownButton(
        value: TemplateService.currentTemplate.templateName,
        items: TemplateService.templates
            .map((e) => DropdownMenuItem(
                  child: Text(e.templateName),
                  value: e.templateName,
                ))
            .toList(),
        onChanged: (option) {
          if (option == null) return;
          print("Selected $option");
          setState(() {
            TemplateService.setCurrentTemplate(option);
          });
        });
  }
}
