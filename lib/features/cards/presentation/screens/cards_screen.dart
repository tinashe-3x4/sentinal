import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';
import 'package:sentinal/app/extensions/card_type_extension.dart';
import 'package:sentinal/app/widgets/add_card_dialog.dart';
import 'package:sentinal/app/widgets/sentinal_loader.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';
import 'package:sentinal/features/cards/presentation/bloc/bloc/cards_bloc.dart';
import 'package:sentinal/gen/assets.gen.dart';
import 'package:u_credit_card/u_credit_card.dart';

@RoutePage()
class SavedCardsScreen extends StatelessWidget {
  const SavedCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: Assets.images.logo.sentinal.svg(width: 50, height: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog<Widget>(
                context: context,
                builder: (context) => const AddCardDialog(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CardsBloc, CardsState>(
        bloc: context.read<CardsBloc>()..add(const LoadCards()),
        builder: (context, state) => switch (state) {
          CardsInitial _ => const Center(
              child: SentinalLoader(),
            ),
          CardsLoading _ => const Center(
              child: SentinalLoader(),
            ),
          CardsLoaded _ => state.cards.isEmpty
              ? Center(
                  child: ElevatedButton.icon(
                    icon: const LineIcon.plus(),
                    onPressed: () {
                      showDialog<Widget>(
                        context: context,
                        builder: (context) => const AddCardDialog(),
                      );
                    },
                    label: const Text('Add a card'),
                  ),
                )
              : _ResponsiveCardsDashboard(cards: state.cards),
          CardAdded _ => const Center(
              child: Text('Card added successfully'),
            ),
          CardDeleted _ => const Center(
              child: Text('Card deleted successfully'),
            ),
          CardsError _ => const Center(
              child: Text('An error occurred'),
            ),
        },
      ),
    );
  }
}

class _ResponsiveCardsDashboard extends StatelessWidget {
  const _ResponsiveCardsDashboard({
    required this.cards,
  });

  final List<CardEntity> cards;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const tabletBreakpoint = 768.0;
        const desktopBreakpoint = 1024.0;

        final width = constraints.maxWidth;

        int crossAxisCount;
        double cardWidth;
        if (width >= desktopBreakpoint) {
          crossAxisCount = 3;
          cardWidth = width / 3.5;
        } else if (width >= tabletBreakpoint) {
          crossAxisCount = 2;
          cardWidth = width / 2.5;
        } else {
          crossAxisCount = 1;
          cardWidth = width * 0.85;
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: width < tabletBreakpoint
              ? ListView.separated(
                  itemCount: cards.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return Center(
                      child: SizedBox(
                        width: cardWidth,
                        child: CreditCardUi(
                          cardHolderFullName: card.cardHolderName,
                          cardNumber: card.cardNumber,
                          validThru: card.expirationDate,
                          creditCardType: CreditCardType.visa,
                        ),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: cardWidth / (cardWidth * 0.6),
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return SizedBox(
                      width: cardWidth,
                      child: CreditCardUi(
                        cardHolderFullName: card.cardHolderName,
                        cardNumber: card.cardNumber,
                        validThru: card.expirationDate,
                        enableFlipping: true,
                        creditCardType: CreditCardTypeExtension.fromString(card.cardType),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
