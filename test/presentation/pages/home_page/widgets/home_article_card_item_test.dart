import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:blogify_flutter_main/common/semantics_labels.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/search_bar_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_article_card_item.dart';
import 'package:blogify_flutter_main/presentation/widgets/app_semantics.dart';
import 'package:blogify_flutter_main/presentation/widgets/post_cover_photo.dart';
import 'package:blogify_flutter_main/utils/intl_day_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockSearchBarNotifier extends Mock implements SearchBarNotifier {}

void main() {
  late MockSearchBarNotifier mockNotifier;
  late PostEntity post;

  setUp(() {
    mockNotifier = MockSearchBarNotifier();
    post = const PostEntity(
      id: 1,
      author: 'John Doe',
      title: 'Flutter Testing',
      imageSrc: '',
      daysAgoPublished: 2,
      minToRead: 5,
      url: '',
    );
    // Default notifier state
    when(() => mockNotifier.selectedFilterType).thenReturn(PostFilter.title);
    when(() => mockNotifier.searchControllerValue).thenReturn('');
  });

  Widget buildTestable({required Widget child}) {
    return ChangeNotifierProvider<SearchBarNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(home: Scaffold(body: child)),
    );
  }

  testWidgets('displays post cover image, author, title, and read time', (tester) async {
    await tester.pumpWidget(
      buildTestable(
        child: HomeArticleCardItem(post: post, onTap: (_) {}),
      ),
    );

    // Cover image
    expect(find.byType(PostCoverPhoto), findsOneWidget);

    // Author
    expect(find.text('John Doe'), findsOneWidget);

    // Title
    expect(find.textContaining('Flutter Testing'), findsOneWidget);

    // Read time label and units
    expect(find.text('${L10n.articleReadTimeLabel} '), findsOneWidget);
    expect(find.text('${post.minToRead} ${L10n.articleReadTimeUnits}'), findsOneWidget);
  });

  testWidgets('onTap is called with correct post id', (tester) async {
    int? tappedId;
    await tester.pumpWidget(
      buildTestable(
        child: HomeArticleCardItem(post: post, onTap: (id) => tappedId = id),
      ),
    );

    await tester.tap(find.byType(InkWell));
    expect(tappedId, post.id);
  });

  testWidgets('highlights author when filter is author and search is not empty', (tester) async {
    when(() => mockNotifier.selectedFilterType).thenReturn(PostFilter.author);
    when(() => mockNotifier.searchControllerValue).thenReturn('John');

    await tester.pumpWidget(
      buildTestable(
        child: HomeArticleCardItem(post: post, onTap: (_) {}),
      ),
    );

    // Should find a HighlightedWord in the TextHighlight widget for author
    final textHighlightFinder = find.byType(TextHighlight).first;
    final textHighlight = tester.widget<TextHighlight>(textHighlightFinder);
    expect(textHighlight.words.containsKey('John'), isTrue);
    expect(textHighlight.text, 'John Doe');
  });

  testWidgets('highlights title when filter is title and search is not empty', (tester) async {
    when(() => mockNotifier.selectedFilterType).thenReturn(PostFilter.title);
    when(() => mockNotifier.searchControllerValue).thenReturn('Flutter');

    await tester.pumpWidget(
      buildTestable(
        child: HomeArticleCardItem(post: post, onTap: (_) {}),
      ),
    );

    // Should find a HighlightedWord in the TextHighlight widget for title
    final textHighlightFinder = find.byType(TextHighlight).last;
    final textHighlight = tester.widget<TextHighlight>(textHighlightFinder);
    expect(textHighlight.words.containsKey('Flutter'), isTrue);
    expect(textHighlight.text, contains('Flutter Testing'));
  });

  testWidgets('displays formatted days ago', (tester) async {
    await tester.pumpWidget(
      buildTestable(
        child: HomeArticleCardItem(post: post, onTap: (_) {}),
      ),
    );

    // The formatted days ago string should be present
    // Adjust this if your formatter returns a different string
    expect(find.text(IntlDayFormatter.getFormattedDays(post.daysAgoPublished)), findsOneWidget);
  });

  testWidgets('has correct semantics label', (tester) async {
    await tester.pumpWidget(
      buildTestable(
        child: HomeArticleCardItem(post: post, onTap: (_) {}),
      ),
    );

    // AppSemantics should have the correct label
    final semanticsFinder = find.byWidgetPredicate(
      (widget) => widget is AppSemantics && widget.label == SemanticsLabels.homeArticleCardItem,
    );
    expect(semanticsFinder, findsOneWidget);
  });
}
