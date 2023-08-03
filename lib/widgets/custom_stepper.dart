import 'package:devpaul_toolkit/config/themes/custom_light_theme.dart';
import 'package:devpaul_toolkit/entities/stepper_item_entity.dart';
import 'package:devpaul_toolkit/widgets/custom_button.dart';
import 'package:flutter/material.dart';

enum StepperButtons { previous, next }

class CustomStepper extends StatefulWidget {
  final List<StepperItemEntity> stepperItems;
  final Color color;
  const CustomStepper(
      {super.key,
      required this.stepperItems,
      this.color = CustomLightTheme.primaryColor});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

int step = 0;

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    StepperItemEntity stepperItem = widget.stepperItems[step];

    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.infinity,
                child: Row(children: [
                  CircleColorContainer(
                    icon: stepperItem.icon,
                    color: widget.color,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Step ${step + 1} / ${widget.stepperItems.length}',
                        style: TextStyle(
                            color: widget.color, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        stepperItem.title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ]),
              ),
              LinearProgressIndicator(
                value: (step + 1) / widget.stepperItems.length,
                semanticsLabel: 'Linear progress indicator',
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(child: stepperItem.content),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'Previous',
                    backgroundColor: Colors.transparent,
                    fontColor: Colors.black54,
                    // borderColor: Colors.black54,
                    width: size.width * 0.4,
                    icon: Icons.arrow_back_ios,
                    internalHorizontalPadding: 2,
                    internalVerticalPadding: 10,
                    onPressed: step <= 0
                        ? null
                        : () => action(
                            StepperButtons.previous, stepperItem.callback),
                  ),
                  CustomButton(
                    text: step >= widget.stepperItems.length - 1
                        ? 'Finish'
                        : 'Next',
                    width: size.width * 0.4,
                    icon: Icons.arrow_forward_ios,
                    rightIcon: true,
                    internalHorizontalPadding: 2,
                    internalVerticalPadding: 10,
                    onPressed: step >= widget.stepperItems.length
                        ? null
                        : () =>
                            action(StepperButtons.next, stepperItem.callback),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  void action(StepperButtons stepperButton, VoidCallback callback) {
    callback();
    setState(() {
      if (stepperButton == StepperButtons.next) {
        if (step == (widget.stepperItems.length - 1)) {
          step = 0;
          Navigator.pop(context);
          return;
        }
        step += 1;
        return;
      }
      step -= 1;
    });
  }
}

class CircleColorContainer extends StatelessWidget {
  final double size;
  final IconData icon;
  final Color color;
  const CircleColorContainer(
      {super.key,
      required this.icon,
      this.size = 70,
      this.color = CustomLightTheme.primaryColor});

  BoxDecoration getBoxDecoration({double borderWidth = 0}) => BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: borderWidth));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: getBoxDecoration(),
      child: Center(
        child: Container(
          width: 65,
          height: 65,
          decoration: getBoxDecoration(borderWidth: 4),
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
