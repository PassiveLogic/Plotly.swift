/// Visualize stages in a process using area-encoded trapezoids. 
///
/// This trace can be used to show data in a part-to-whole representation similar to a "pie" trace,
/// wherein each item appears in a single stage. See also the "funnel" trace type for a different
/// approach to visualizing funnel data.
public struct FunnelArea: Trace {
    public let type: String = "funnelarea"

    public let animatable: Bool = false

    /// Determines whether or not this trace is visible. 
    ///
    /// If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the
    /// legend itself is visible).
    public var visible: Visible0?

    /// Determines whether or not an item corresponding to this trace is shown in the legend.
    public var showLegend: Bool?

    /// Sets the legend group for this trace. 
    ///
    /// Traces part of the same legend group hide/show at the same time when toggling legend items.
    public var legendGroup: String?

    /// Sets the opacity of the trace.
    public var opacity: Double?

    /// Sets the trace name. 
    ///
    /// The trace name appear as the legend item and on hover.
    public var name: String?

    /// Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.
    public var uid: String?

    /// Assigns id labels to each datum. 
    ///
    /// These ids for object constancy of data points during animation. Should be an array of strings,
    /// not numbers or any other type.
    public var ids: [Double]?

    /// Assigns extra data each datum. 
    ///
    /// This may be useful when listening to hover, click and selection events. Note that, *scatter*
    /// traces also appends customdata items in the markers DOM elements
    public var customData: [Double]?

    /// Assigns extra meta information associated with this trace that can be used in various text attributes. 
    ///
    /// Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text`
    /// `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the
    /// trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the
    /// index or key of the `meta` item in question. To access trace `meta` in layout attributes, use
    /// `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.
    public var meta: Anything?

    public var hoverLabel: HoverLabel0?

    public var stream: Stream0?

    public var transforms: TickFormatStops0?

    /// Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. 
    ///
    /// Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are
    /// controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`,
    /// `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible
    /// with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are
    /// tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app
    /// can add/remove traces before the end of the `data` array, such that the same trace has a
    /// different index, you can still preserve user-driven changes if you give each trace a `uid` that
    /// stays with it as it moves.
    public var uiRevision: Anything?

    /// Sets the sector labels. 
    ///
    /// If `labels` entries are duplicated, we sum associated `values` or simply count occurrences if
    /// `values` is not provided. For other array attributes (including color) we use the first
    /// non-empty entry among all occurrences of the label.
    public var labels: [Double]?

    /// Alternate to `labels`. 
    ///
    /// Builds a numeric set of labels. Use with `dlabel` where `label0` is the starting label and
    /// `dlabel` the step.
    public var label0: Double?

    /// Sets the label step. 
    ///
    /// See `label0` for more info.
    public var dLabel: Double?

    /// Sets the values of the sectors. 
    ///
    /// If omitted, we count occurrences of each label.
    public var values: [Double]?

    /// - traces/funnelarea/attributes/marker
    public struct Marker: Encodable {
        /// Sets the color of each sector. 
        ///
        /// If not specified, the default trace color set is used to pick the sector colors.
        public var colors: [Double]?
    
        public var line: Line3?
    
        /// Sets the source reference on plot.ly for  colors .
        public var colorsSource: String?
    
        /// Plotly compatible property encoding
        enum CodingKeys: String, CodingKey {
            case colors
            case line
            case colorsSource = "colorssrc"
        }
        
        public init(colors: [Double]? = nil, line: Line3? = nil, colorsSource: String? = nil) {
            self.colors = colors
            self.line = line
            self.colorsSource = colorsSource
        }
    }
    public var marker: Marker?

    /// Sets text elements associated with each sector. 
    ///
    /// If trace `textinfo` contains a *text* flag, these elements will be seen on the chart. If trace
    /// `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in
    /// the hover labels.
    public var text: [Double]?

    /// Sets hover text elements associated with each sector. 
    ///
    /// If a single string, the same string appears for all data points. If an array of string, the
    /// items are mapped in order of this trace's sectors. To be seen, trace `hoverinfo` must contain a
    /// *text* flag.
    public var hoverText: String?

    /// If there are multiple funnelareas that should be sized according to their totals, link them by providing a non-empty group id here shared by every trace in the same group.
    public var scaleGroup: String?

    /// Determines which trace information appear on the graph.
    /// - traces/funnelarea/attributes/textinfo
    public struct TextInfo: OptionSet, Encodable {
        public let rawValue: Int
    
        public static let label = TextInfo(rawValue: 1 << 0)
        public static let text = TextInfo(rawValue: 1 << 1)
        public static let value = TextInfo(rawValue: 1 << 2)
        public static let percent = TextInfo(rawValue: 1 << 3)
        public static let none = TextInfo(rawValue: 1 << 4)
    
        public init(rawValue: Int) { self.rawValue = rawValue }
    
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["label"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["value"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["percent"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["none"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    /// Determines which trace information appear on the graph.
    public var textInfo: TextInfo?

    /// Template string used for rendering the information text that appear on points. 
    ///
    /// Note that this will override `textinfo`. Variables are inserted using %{variable}, for example
    /// "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example
    /// "Price: %{y:$.2f}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on
    /// the formatting syntax. Dates are formatted using d3-time-format's syntax
    /// %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format for details on
    /// the date formatting syntax. Every attributes that can be specified per-point (the ones that are
    /// `arrayOk: true`) are available. variables `label`, `color`, `value`, `text` and `percent`.
    public var textTemplate: String?

    /// Determines which trace information appear on hover. 
    ///
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    /// - traces/funnelarea/attributes/hoverinfo
    public struct HoverInfo: OptionSet, Encodable {
        public let rawValue: Int
    
        public static let label = HoverInfo(rawValue: 1 << 0)
        public static let text = HoverInfo(rawValue: 1 << 1)
        public static let value = HoverInfo(rawValue: 1 << 2)
        public static let percent = HoverInfo(rawValue: 1 << 3)
        public static let name = HoverInfo(rawValue: 1 << 4)
        public static let all = HoverInfo(rawValue: 1 << 5)
        public static let none = HoverInfo(rawValue: 1 << 6)
        public static let skip = HoverInfo(rawValue: 1 << 7)
    
        public init(rawValue: Int) { self.rawValue = rawValue }
    
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["label"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["value"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["percent"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["name"] }
            if (self.rawValue & 1 << 5) != 0 { options += ["all"] }
            if (self.rawValue & 1 << 6) != 0 { options += ["none"] }
            if (self.rawValue & 1 << 7) != 0 { options += ["skip"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    /// Determines which trace information appear on hover. 
    ///
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    public var hoverInfo: HoverInfo?

    /// Template string used for rendering the information that appear on hover box. 
    ///
    /// Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example
    /// "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example
    /// "Price: %{y:$.2f}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on
    /// the formatting syntax. Dates are formatted using d3-time-format's syntax
    /// %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format for details on
    /// the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as
    /// event data described at this link https://plot.ly/javascript/plotlyjs-events/#event-data.
    /// Additionally, every attributes that can be specified per-point (the ones that are `arrayOk:
    /// true`) are available. variables `label`, `color`, `value`, `text` and `percent`. Anything
    /// contained in tag `<extra>` is displayed in the secondary box, for example
    /// "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag
    /// `<extra></extra>`.
    public var hoverTemplate: String?

    /// Specifies the location of the `textinfo`.
    /// - traces/funnelarea/attributes/textposition
    public enum TextPosition: String, Encodable {
        case inside
        case none
    }
    /// Specifies the location of the `textinfo`.
    public var textPosition: TextPosition?

    /// Sets the font used for `textinfo`.
    public var textFont: Font1?

    /// Sets the font used for `textinfo` lying inside the sector.
    public var insideTextFont: Font1?

    /// - traces/funnelarea/attributes/title
    public struct Title: Encodable {
        /// Sets the title of the chart. 
        ///
        /// If it is empty, no title is displayed. Note that before the existence of `title.text`, the
        /// title's contents used to be defined as the `title` attribute itself. This behavior has been
        /// deprecated.
        public var text: String?
    
        /// Sets the font used for `title`. 
        ///
        /// Note that the title's font used to be set by the now deprecated `titlefont` attribute.
        public var font: Font1?
    
        /// Specifies the location of the `title`. 
        ///
        /// Note that the title's position used to be set by the now deprecated `titleposition` attribute.
        /// - traces/funnelarea/attributes/title/position
        public enum Position: String, Encodable {
            case topLeft = "top left"
            case topCenter = "top center"
            case topRight = "top right"
        }
        /// Specifies the location of the `title`. 
        ///
        /// Note that the title's position used to be set by the now deprecated `titleposition` attribute.
        public var position: Position?
    
        public init(text: String? = nil, font: Font1? = nil, position: Position? = nil) {
            self.text = text
            self.font = font
            self.position = position
        }
    }
    public var title: Title?

    public var domain: Domain0?

    /// Sets the ratio between height and width
    public var aspectRatio: Double?

    /// Sets the ratio between bottom length and maximum top length.
    public var baseRatio: Double?

    /// Sets the source reference on plot.ly for  ids .
    public var idsSource: String?

    /// Sets the source reference on plot.ly for  customdata .
    public var customDataSource: String?

    /// Sets the source reference on plot.ly for  meta .
    public var metaSource: String?

    /// Sets the source reference on plot.ly for  labels .
    public var labelsSource: String?

    /// Sets the source reference on plot.ly for  values .
    public var valuesSource: String?

    /// Sets the source reference on plot.ly for  text .
    public var textSource: String?

    /// Sets the source reference on plot.ly for  hovertext .
    public var hoverTextSource: String?

    /// Sets the source reference on plot.ly for  texttemplate .
    public var textTemplateSource: String?

    /// Sets the source reference on plot.ly for  hoverinfo .
    public var hoverInfoSource: String?

    /// Sets the source reference on plot.ly for  hovertemplate .
    public var hoverTemplateSource: String?

    /// Sets the source reference on plot.ly for  textposition .
    public var textPositionSource: String?

    /// Plotly compatible property encoding
    enum CodingKeys: String, CodingKey {
        case type
        case animatable
        case visible
        case showLegend = "showlegend"
        case legendGroup = "legendgroup"
        case opacity
        case name
        case uid
        case ids
        case customData = "customdata"
        case meta
        case hoverLabel = "hoverlabel"
        case stream
        case transforms
        case uiRevision = "uirevision"
        case labels
        case label0
        case dLabel = "dlabel"
        case values
        case marker
        case text
        case hoverText = "hovertext"
        case scaleGroup = "scalegroup"
        case textInfo = "textinfo"
        case textTemplate = "texttemplate"
        case hoverInfo = "hoverinfo"
        case hoverTemplate = "hovertemplate"
        case textPosition = "textposition"
        case textFont = "textfont"
        case insideTextFont = "insidetextfont"
        case title
        case domain
        case aspectRatio = "aspectratio"
        case baseRatio = "baseratio"
        case idsSource = "idssrc"
        case customDataSource = "customdatasrc"
        case metaSource = "metasrc"
        case labelsSource = "labelssrc"
        case valuesSource = "valuessrc"
        case textSource = "textsrc"
        case hoverTextSource = "hovertextsrc"
        case textTemplateSource = "texttemplatesrc"
        case hoverInfoSource = "hoverinfosrc"
        case hoverTemplateSource = "hovertemplatesrc"
        case textPositionSource = "textpositionsrc"
    }
    
    public init(visible: Visible0? = nil, showLegend: Bool? = nil, legendGroup: String? = nil, opacity: Double? = nil, name: String? = nil, uid: String? = nil, ids: [Double]? = nil, customData: [Double]? = nil, meta: Anything? = nil, hoverLabel: HoverLabel0? = nil, stream: Stream0? = nil, transforms: TickFormatStops0? = nil, uiRevision: Anything? = nil, labels: [Double]? = nil, label0: Double? = nil, dLabel: Double? = nil, values: [Double]? = nil, marker: Marker? = nil, text: [Double]? = nil, hoverText: String? = nil, scaleGroup: String? = nil, textInfo: TextInfo? = nil, textTemplate: String? = nil, hoverInfo: HoverInfo? = nil, hoverTemplate: String? = nil, textPosition: TextPosition? = nil, textFont: Font1? = nil, insideTextFont: Font1? = nil, title: Title? = nil, domain: Domain0? = nil, aspectRatio: Double? = nil, baseRatio: Double? = nil, idsSource: String? = nil, customDataSource: String? = nil, metaSource: String? = nil, labelsSource: String? = nil, valuesSource: String? = nil, textSource: String? = nil, hoverTextSource: String? = nil, textTemplateSource: String? = nil, hoverInfoSource: String? = nil, hoverTemplateSource: String? = nil, textPositionSource: String? = nil) {
        self.visible = visible
        self.showLegend = showLegend
        self.legendGroup = legendGroup
        self.opacity = opacity
        self.name = name
        self.uid = uid
        self.ids = ids
        self.customData = customData
        self.meta = meta
        self.hoverLabel = hoverLabel
        self.stream = stream
        self.transforms = transforms
        self.uiRevision = uiRevision
        self.labels = labels
        self.label0 = label0
        self.dLabel = dLabel
        self.values = values
        self.marker = marker
        self.text = text
        self.hoverText = hoverText
        self.scaleGroup = scaleGroup
        self.textInfo = textInfo
        self.textTemplate = textTemplate
        self.hoverInfo = hoverInfo
        self.hoverTemplate = hoverTemplate
        self.textPosition = textPosition
        self.textFont = textFont
        self.insideTextFont = insideTextFont
        self.title = title
        self.domain = domain
        self.aspectRatio = aspectRatio
        self.baseRatio = baseRatio
        self.idsSource = idsSource
        self.customDataSource = customDataSource
        self.metaSource = metaSource
        self.labelsSource = labelsSource
        self.valuesSource = valuesSource
        self.textSource = textSource
        self.hoverTextSource = hoverTextSource
        self.textTemplateSource = textTemplateSource
        self.hoverInfoSource = hoverInfoSource
        self.hoverTemplateSource = hoverTemplateSource
        self.textPositionSource = textPositionSource
    }
}