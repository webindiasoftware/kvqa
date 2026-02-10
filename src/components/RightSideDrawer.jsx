import { FaChevronRight } from "react-icons/fa";

export default function RightSideDrawer({
  open,
  onClose,
  title,
  sections = []
}) {
  return (
    <>
      {/* Overlay */}
      {open && (
        <div
          onClick={onClose}
          className="fixed inset-0 bg-black/50 z-40"
        />
      )}

      {/* Drawer */}
      <div
        className={`fixed top-0 right-0 h-full w-[320px] bg-white z-50 transform transition-transform duration-300 ease-in-out ${
          open ? "translate-x-0" : "translate-x-full"
        }`}
      >
        {/* Header */}
        <div className="bg-[#cf1b2b] h-[60px] px-5 flex items-center justify-between text-white">
          <h2 className="text-[18px] font-semibold leading-none">
            {title}
          </h2>

          <button
            onClick={onClose}
            className="w-8 h-8 flex items-center justify-center text-white"
          >
            <FaChevronRight size={14} />
          </button>
        </div>

        {/* Content */}
        <div className="px-5 pt-4 text-[14px] text-black">
          {sections.map((section, idx) => (
            <div key={idx} className="mb-5 last:mb-0">
              <h3 className="font-semibold text-[15px] mb-2">
                {section.heading}
              </h3>

              <div>
                {section.items.map((item, i) => (
                  <MenuItem
                    key={i}
                    label={item.label}
                    onClick={item.onClick}
                  />
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </>
  );
}

function MenuItem({ label, onClick }) {
  return (
    <div
      onClick={onClick}
      className="py-[10px] border-b border-dashed border-gray-300 cursor-pointer
                 text-gray-900 hover:text-[#cf1b2b]"
    >
      {label}
    </div>
  );
}
